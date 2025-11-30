#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Win32Enum.ahk
#Include ../Windows/Win32/UI/Controls/COMBOBOX_EX_ITEM_FLAGS.ahk
#Include ../Windows/Win32/UI/Controls/COMBOBOXPARTS.ahk

class Win32EnumTests {

    class NormalEnums {

        ToString_WithEnumValue_ReturnsString() {
            Assert.Equals(COMBOBOXPARTS.ToString(COMBOBOXPARTS.CP_BORDER), "CP_BORDER")
            Assert.Equals(COMBOBOXPARTS.ToString(9), "CP_DROPDOWNITEM")
            Assert.Equals(COMBOBOXPARTS.ToString("5"), "CP_READONLY")
        }

        ToString_WithNonEnumValue_ThrowsValueError() {
            Assert.Throws((*) => COMBOBOXPARTS.ToString(10), ValueError)
        }

        ToString_WithNonIntegerValue_ThrowsTypeError() {
            Assert.Throws((*) => COMBOBOXPARTS.ToString({}), TypeError)
        }

        __Item_WithEnumValue_ReturnsString() {
            Assert.Equals(COMBOBOXPARTS[COMBOBOXPARTS.CP_BORDER], "CP_BORDER")
            Assert.Equals(COMBOBOXPARTS[9], "CP_DROPDOWNITEM")
            Assert.Equals(COMBOBOXPARTS["5"], "CP_READONLY")
        }
    }

    class BitflagEnums {
        __Item_WithEnumValue_ReturnsString() {
            Assert.Equals(COMBOBOX_EX_ITEM_FLAGS[COMBOBOX_EX_ITEM_FLAGS.CBEIF_TEXT], "CBEIF_TEXT")
            Assert.Equals(COMBOBOX_EX_ITEM_FLAGS[8], "CBEIF_OVERLAY")
            Assert.Equals(COMBOBOX_EX_ITEM_FLAGS["2"], "CBEIF_IMAGE")
        }

        HasFlag_WithFlag_ReturnsTrue() {
            YUnit.Assert(COMBOBOX_EX_ITEM_FLAGS.HasFlag(2, COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE))
        }

        HasFlag_WithoutFlag_ReturnsFalse() {
            YUnit.Assert(!COMBOBOX_EX_ITEM_FLAGS.HasFlag(1, COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE))
        }

        HasFlags_WithAllFlags_ReturnsTrue(){
            val := COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE | COMBOBOX_EX_ITEM_FLAGS.CBEIF_TEXT
            YUnit.Assert(COMBOBOX_EX_ITEM_FLAGS.HasFlags(val, COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE, COMBOBOX_EX_ITEM_FLAGS.CBEIF_TEXT))
        }

        HasFlags_WithPartialMatch_ReturnsFalse(){
            val := COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE | COMBOBOX_EX_ITEM_FLAGS.CBEIF_TEXT
            YUnit.Assert(!COMBOBOX_EX_ITEM_FLAGS.HasFlags(val, COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE, COMBOBOX_EX_ITEM_FLAGS.CBEIF_DI_SETITEM))
        }

        ToString_WithMultipleValues_ReturnsPipeDelimitedList() {
            val := COMBOBOX_EX_ITEM_FLAGS.CBEIF_IMAGE | COMBOBOX_EX_ITEM_FLAGS.CBEIF_TEXT
            Assert.Equals(COMBOBOX_EX_ITEM_FLAGS.ToString(val), "CBEIF_IMAGE | CBEIF_TEXT")
        }
    }

}