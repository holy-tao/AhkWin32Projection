#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ImageEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IImageEncodingPropertiesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageEncodingPropertiesStatics2
     * @type {Guid}
     */
    static IID => Guid("{f6c25b29-3824-46b0-956e-501329e1be3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUncompressed", "CreateBmp"]

    /**
     * 
     * @param {Integer} format 
     * @returns {ImageEncodingProperties} 
     */
    CreateUncompressed(format) {
        result := ComCall(6, this, "int", format, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageEncodingProperties(value)
    }

    /**
     * 
     * @returns {ImageEncodingProperties} 
     */
    CreateBmp() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageEncodingProperties(value)
    }
}
