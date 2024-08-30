"""
Sample test
"""
# Importación de módulo de Test simple de Django
from django.test import SimpleTestCase

# Importación de módulo a testar
from app import calc

class CalcTests(SimpleTestCase):
    """Test the calc module

    Args:
        SimpleTestCase (_type_): _description_
    """
    
    def test_add_numbers(self):
        """Test adding numbers together"""
        res = calc.add(5,6)
        
        self.assertEqual(res,11)
        
    
    def test_substract_numbers(self):
        """Test substracting numbers"""
        res = calc.substract(10,15)
        
        self.assertEqual(res,-5)