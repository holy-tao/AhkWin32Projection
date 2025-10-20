#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCdromCollection interface provides a way to organize and access a collection of CD or DVD drives.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromCollection extends IDispatch{
    /**
     * The interface identifier for IWMPCdromCollection
     * @type {Guid}
     */
    static IID => Guid("{ee4c8fe2-34b2-11d3-a3bf-006097c9b344}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPCdrom>} ppItem 
     * @returns {HRESULT} 
     */
    item(lIndex, ppItem) {
        result := ComCall(8, this, "int", lIndex, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDriveSpecifier 
     * @param {Pointer<IWMPCdrom>} ppCdrom 
     * @returns {HRESULT} 
     */
    getByDriveSpecifier(bstrDriveSpecifier, ppCdrom) {
        bstrDriveSpecifier := bstrDriveSpecifier is String ? BSTR.Alloc(bstrDriveSpecifier).Value : bstrDriveSpecifier

        result := ComCall(9, this, "ptr", bstrDriveSpecifier, "ptr", ppCdrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
