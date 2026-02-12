#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BITS_FILE_PROPERTY_VALUE.ahk
#Include .\IBackgroundCopyFile4.ahk

/**
 * Use this interface to get or set generic properties of BITS file transfers.
 * @see https://learn.microsoft.com/windows/win32/api//content/bits5_0/nn-bits5_0-ibackgroundcopyfile5
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
     * Sets a generic property of a BITS file transfer.
     * @param {Integer} PropertyId Specifies the property to be set.
     * @param {BITS_FILE_PROPERTY_VALUE} PropertyValue_ A pointer to a union that specifies the value to be set. The union member appropriate for the property ID is used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/bits5_0/nf-bits5_0-ibackgroundcopyfile5-setproperty
     */
    SetProperty(PropertyId, PropertyValue_) {
        result := ComCall(13, this, "int", PropertyId, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a generic property of a BITS file transfer.
     * @param {Integer} PropertyId Specifies the file property whose value is to be retrieved.
     * @returns {BITS_FILE_PROPERTY_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api//content/bits5_0/nf-bits5_0-ibackgroundcopyfile5-getproperty
     */
    GetProperty(PropertyId) {
        PropertyValue_ := BITS_FILE_PROPERTY_VALUE()
        result := ComCall(14, this, "int", PropertyId, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyValue_
    }
}
