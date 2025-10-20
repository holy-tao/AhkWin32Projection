#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPrivateConnectionCollection interface makes it possible for scripting languages such as VBScript and JScript to enumerate private connections.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingprivateconnectioncollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPrivateConnectionCollection extends IDispatch{
    /**
     * The interface identifier for INetSharingPrivateConnectionCollection
     * @type {Guid}
     */
    static IID => Guid("{38ae69e0-4409-402a-a2cb-e965c727f840}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
