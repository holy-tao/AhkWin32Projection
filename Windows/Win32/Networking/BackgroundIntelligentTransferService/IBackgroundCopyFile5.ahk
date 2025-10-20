#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile4.ahk

/**
 * Use this interface to get or set generic properties of BITS file transfers.
 * @see https://docs.microsoft.com/windows/win32/api//bits5_0/nn-bits5_0-ibackgroundcopyfile5
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile5 extends IBackgroundCopyFile4{
    /**
     * The interface identifier for IBackgroundCopyFile5
     * @type {Guid}
     */
    static IID => Guid("{85c1657f-dafc-40e8-8834-df18ea25717e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {BITS_FILE_PROPERTY_VALUE} PropertyValue 
     * @returns {HRESULT} 
     */
    SetProperty(PropertyId, PropertyValue) {
        result := ComCall(13, this, "int", PropertyId, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {Pointer<BITS_FILE_PROPERTY_VALUE>} PropertyValue 
     * @returns {HRESULT} 
     */
    GetProperty(PropertyId, PropertyValue) {
        result := ComCall(14, this, "int", PropertyId, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
