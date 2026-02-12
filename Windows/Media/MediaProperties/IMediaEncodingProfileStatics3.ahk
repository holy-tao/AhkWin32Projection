#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaEncodingProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfileStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfileStatics3
     * @type {Guid}
     */
    static IID => Guid("{90dac5aa-cf76-4294-a9ed-1a1420f51f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAlac", "CreateFlac", "CreateHevc"]

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateAlac(quality_) {
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
    CreateFlac(quality_) {
        result := ComCall(7, this, "int", quality_, "ptr*", &value := 0, "int")
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
    CreateHevc(quality_) {
        result := ComCall(8, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }
}
