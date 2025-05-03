import asyncio
import os
from aiogram import Bot, Dispatcher, types
from aiogram.types import Message
from aiogram import F
from aiogram.fsm.storage.memory import MemoryStorage

# ⏳ URL на countdown
RELEASE_URL = "https://www.tickcounter.com/countdown/7230262/my-countdown"

# 🪪 Токен бота
TOKEN = os.getenv("TELEGRAM_TOKEN")

# 🔧 Ініціалізація
bot = Bot(token=TOKEN)
dp = Dispatcher(storage=MemoryStorage())

@dp.message(F.text.in_({"start", "/start", "release", "/release", "реліз"}))
async def send_release(message: Message):
    await message.answer(
        f"🚀 Реліз PricePulsarium вже скоро!\n"
        f"Слідкуй за таймером тут: {RELEASE_URL}"
    )

async def main():
    await bot.delete_webhook(drop_pending_updates=True)
    await dp.start_polling(bot)

if __name__ == "__main__":
    asyncio.run(main())
