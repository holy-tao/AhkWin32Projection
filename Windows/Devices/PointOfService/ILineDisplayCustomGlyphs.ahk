#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayCustomGlyphs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayCustomGlyphs
     * @type {Guid}
     */
    static IID => Guid("{2257f63c-f263-44f1-a1a0-e750a6a0ec54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SizeInPixels", "get_SupportedGlyphCodes", "TryRedefineAsync"]

    /**
     * @type {SIZE} 
     */
    SizeInPixels {
        get => this.get_SizeInPixels()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedGlyphCodes {
        get => this.get_SupportedGlyphCodes()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_SizeInPixels() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedGlyphCodes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {Integer} glyphCode 
     * @param {IBuffer} glyphData_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRedefineAsync(glyphCode, glyphData_) {
        result := ComCall(8, this, "uint", glyphCode, "ptr", glyphData_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
