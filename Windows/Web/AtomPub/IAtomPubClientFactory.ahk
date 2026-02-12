#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AtomPubClient.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class IAtomPubClientFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAtomPubClientFactory
     * @type {Guid}
     */
    static IID => Guid("{49d55012-57cb-4bde-ab9f-2610b172777b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAtomPubClientWithCredentials"]

    /**
     * 
     * @param {PasswordCredential} serverCredential 
     * @returns {AtomPubClient} 
     */
    CreateAtomPubClientWithCredentials(serverCredential) {
        result := ComCall(6, this, "ptr", serverCredential, "ptr*", &atomPubClient_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AtomPubClient(atomPubClient_)
    }
}
