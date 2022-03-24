extern cant;
int main(void)
{
	/*
	 * TODO: Make it so you print:
	 *    price is 21
	 *    quantity is 42
	 * without directly calling a printing function from an existing
	 * library(do NOT use printf, fprintf, fwrite, ...).
	 */
	price(set_price(21));
	cant = 42;
	print_cant(&cant);
	
	return 0;
}
