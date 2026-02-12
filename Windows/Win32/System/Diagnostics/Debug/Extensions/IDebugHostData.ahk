#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\Location.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostData extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostData
     * @type {Guid}
     */
    static IID => Guid("{a3d64993-826c-44fa-897d-926f2fe7ad0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocationKind", "GetLocation", "GetValue"]

    /**
     * 
     * @returns {Integer} 
     */
    GetLocationKind() {
        result := ComCall(10, this, "int*", &locationKind_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return locationKind_
    }

    /**
     * 
     * @returns {Location} 
     */
    GetLocation() {
        location_ := Location()
        result := ComCall(11, this, "ptr", location_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return location_
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValue() {
        value := VARIANT()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
