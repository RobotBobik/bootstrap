from aiogram import Bot, Dispatcher, types
import asyncio
import os

TOKEN = os.getenv("TELEGRAM_TOKEN")
RELEASE_URL = "https://www.tickcounter.com/countdown/7230262/my-countdown"

router = Router()

@router.message(commands=["start", "реліз", "release"])
async def send_release(message: types.Message):
    await message.answer(
        f"🚀 Реліз PricePulsarium вже скоро!\n\n"
        f"Слідкуй за таймером тут: {RELEASE_URL}"
    )

dp.include_router(router)

async def main():
    await bot.delete_webhook(drop_pending_updates=True)
    await dp.start_polling(bot)

if __name__ == "__main__":
    asyncio.run(main())