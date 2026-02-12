#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VideoEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IVideoEncodingPropertiesStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEncodingPropertiesStatics3
     * @type {Guid}
     */
    static IID => Guid("{65b46685-60da-5e51-91a2-b38c4763b872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVp9", "CreateAv1"]

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    CreateVp9() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(result_)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    CreateAv1() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(result_)
    }
}
