#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaEncodingProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfileStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfileStatics2
     * @type {Guid}
     */
    static IID => Guid("{ce8de74f-6af4-4288-8fe2-79adf1f79a43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWav", "CreateAvi"]

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateWav(quality_) {
        result := ComCall(6, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateAvi(quality_) {
        result := ComCall(7, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }
}
