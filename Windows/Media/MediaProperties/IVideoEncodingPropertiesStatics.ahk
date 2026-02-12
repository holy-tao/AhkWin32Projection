#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VideoEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IVideoEncodingPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEncodingPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{3ce14d44-1dc5-43db-9f38-ebebf90152cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateH264", "CreateMpeg2", "CreateUncompressed"]

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    CreateH264() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    CreateMpeg2() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {VideoEncodingProperties} 
     */
    CreateUncompressed(subtype, width, height) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(8, this, "ptr", subtype, "uint", width, "uint", height, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }
}
