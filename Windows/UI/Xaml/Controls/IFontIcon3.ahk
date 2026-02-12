#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFontIcon3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontIcon3
     * @type {Guid}
     */
    static IID => Guid("{6155d919-1c6c-4950-8794-231ef0914d94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MirroredWhenRightToLeft", "put_MirroredWhenRightToLeft"]

    /**
     * @type {Boolean} 
     */
    MirroredWhenRightToLeft {
        get => this.get_MirroredWhenRightToLeft()
        set => this.put_MirroredWhenRightToLeft(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MirroredWhenRightToLeft() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MirroredWhenRightToLeft(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
