#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ImageEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IImageEncodingPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageEncodingPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{257c68dc-8b99-439e-aa59-913a36161297}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateJpeg", "CreatePng", "CreateJpegXR"]

    /**
     * 
     * @returns {ImageEncodingProperties} 
     */
    CreateJpeg() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageEncodingProperties(value)
    }

    /**
     * 
     * @returns {ImageEncodingProperties} 
     */
    CreatePng() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageEncodingProperties(value)
    }

    /**
     * 
     * @returns {ImageEncodingProperties} 
     */
    CreateJpegXR() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageEncodingProperties(value)
    }
}
