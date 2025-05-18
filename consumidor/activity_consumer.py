# import asyncio
# import json
# import nats
# from sqlalchemy.orm import Session
# from config.DB.db import SessionLocal
# from models.activity_model import Activity

# nats_data = []

# def get_db():
#     db = SessionLocal()
#     try:
#         yield db
#     finally:
#         db.close()

# async def consume_nats():
#     """Escucha mensajes de NATS en el canal 'activity.crear' y los guarda en la base de datos."""
#     nc = await nats.connect("nats://localhost:4222")  

#     async def message_handler(msg):
#         """Procesa y guarda los mensajes en la base de datos."""
#         data = msg.data.decode()
#         print(f"📩 Recibido: {data}")

#         try:
#             activity_data = json.loads(data)
#             nats_data.append(activity_data)

            
#             with get_db() as db:
#                 new_activity = Activity(**activity_data)  
#                 db.add(new_activity)
#                 db.commit()
#                 db.refresh(new_activity)

#                 print(f"✅ Actividad guardada con ID {new_activity.id}")

#         except Exception as e:
#             print(f"❌ Error al procesar el mensaje: {e}")

#     await nc.subscribe("activity.crear", cb=message_handler)

#     print("✅ Consumidor NATS corriendo...")
#     while True:
#         await asyncio.sleep(1)
