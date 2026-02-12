#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Core\TimedMetadataStreamDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfile3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfile3
     * @type {Guid}
     */
    static IID => Guid("{ba6ebe88-7570-4e69-accf-5611ad015f88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTimedMetadataTracks", "GetTimedMetadataTracks"]

    /**
     * 
     * @param {IIterable<TimedMetadataStreamDescriptor>} value 
     * @returns {HRESULT} 
     */
    SetTimedMetadataTracks(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<TimedMetadataStreamDescriptor>} 
     */
    GetTimedMetadataTracks() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(TimedMetadataStreamDescriptor, result_)
    }
}
