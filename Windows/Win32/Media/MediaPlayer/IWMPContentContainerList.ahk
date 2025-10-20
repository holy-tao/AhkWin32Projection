#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nn-contentpartner-iwmpcontentcontainerlist
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentContainerList extends IUnknown{
    /**
     * The interface identifier for IWMPContentContainerList
     * @type {Guid}
     */
    static IID => Guid("{a9937f78-0802-4af8-8b8d-e3f045bc8ab5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pwmptt 
     * @returns {HRESULT} 
     */
    GetTransactionType(pwmptt) {
        result := ComCall(3, this, "int*", pwmptt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcContainer 
     * @returns {HRESULT} 
     */
    GetContainerCount(pcContainer) {
        result := ComCall(4, this, "uint*", pcContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idxContainer 
     * @param {Pointer<IWMPContentContainer>} ppContent 
     * @returns {HRESULT} 
     */
    GetContainer(idxContainer, ppContent) {
        result := ComCall(5, this, "uint", idxContainer, "ptr", ppContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
