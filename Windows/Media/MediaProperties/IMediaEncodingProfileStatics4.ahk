#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaEncodingProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfileStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfileStatics4
     * @type {Guid}
     */
    static IID => Guid("{6fafd7b5-9404-514a-81dd-c9444d648af0}")

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
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateVp9(quality_) {
        result := ComCall(6, this, "int", quality_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(result_)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateAv1(quality_) {
        result := ComCall(7, this, "int", quality_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(result_)
    }
}
