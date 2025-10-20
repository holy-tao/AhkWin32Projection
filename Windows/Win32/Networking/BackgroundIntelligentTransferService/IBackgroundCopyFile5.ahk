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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "GetProperty"]

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {BITS_FILE_PROPERTY_VALUE} PropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyfile5-setproperty
     */
    SetProperty(PropertyId, PropertyValue) {
        result := ComCall(13, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {Pointer<BITS_FILE_PROPERTY_VALUE>} PropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyfile5-getproperty
     */
    GetProperty(PropertyId, PropertyValue) {
        result := ComCall(14, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return result
    }
}
