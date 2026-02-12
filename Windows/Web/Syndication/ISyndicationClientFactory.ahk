#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SyndicationClient.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationClientFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationClientFactory
     * @type {Guid}
     */
    static IID => Guid("{2ec4b32c-a79b-4114-b29a-05dffbafb9a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationClient"]

    /**
     * 
     * @param {PasswordCredential} serverCredential 
     * @returns {SyndicationClient} 
     */
    CreateSyndicationClient(serverCredential) {
        result := ComCall(6, this, "ptr", serverCredential, "ptr*", &syndicationClient_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationClient(syndicationClient_)
    }
}
