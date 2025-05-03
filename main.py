from aiogram import Bot, Dispatcher, types
import asyncio
import os

TOKEN = os.getenv("TELEGRAM_TOKEN")
RELEASE_URL = "https://www.tickcounter.com/countdown/7230262/my-countdown"

bot = Bot(token=TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=["start", "реліз", "release"])
async def send_release(message: types.Message):
    await message.answer(
        f"🚀 Реліз PricePulsarium вже скоро!\n\n"
        f"Слідкуй за таймером тут: {RELEASE_URL}"
    )

if __name__ == "__main__":
    from aiogram import executor
    executor.start_polling(dp)