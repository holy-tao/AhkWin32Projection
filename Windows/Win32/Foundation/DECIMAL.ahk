#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DECIMAL structure represents a decimal data type that provides a sign and scale for a number.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-decimal~r1
 * @namespace Windows.Win32.Foundation
 */
export default struct DECIMAL {
    #StructPack 8

    /**
     * Reserved.
     */
    wReserved : UInt16

    scale : Int8

    sign : Int8

    /**
     * The high 32 bits of the number.
     */
    Hi32 : UInt32

    Lo32 : UInt32

    Mid32 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'signscale', { type: UInt16, offset: 2 })
        DefineProp(this.Prototype, 'Lo64', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
