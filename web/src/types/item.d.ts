interface ShopItem {
  name: string
  label: string
  category: string
  price: number
  metadata?: Record<string, any>
}

interface CartItem extends ShopItem {
  quantity: number
}
