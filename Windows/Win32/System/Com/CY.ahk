#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CY structure is useful for calculations involving money, or for any fixed-point calculation where accuracy is particularly important.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-cy~r1
 * @namespace Windows.Win32.System.Com
 */
export default struct CY {
    #StructPack 8

    Lo : UInt32

    Hi : Int32

    static __New() {
        DefineProp(this.Prototype, 'int64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
