#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapImage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapImage2
     * @type {Guid}
     */
    static IID => Guid("{1069c1b6-8c9b-4762-be3d-759f5698f2b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DecodePixelType", "put_DecodePixelType"]

    /**
     * @type {Integer} 
     */
    DecodePixelType {
        get => this.get_DecodePixelType()
        set => this.put_DecodePixelType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodePixelType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodePixelType(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
