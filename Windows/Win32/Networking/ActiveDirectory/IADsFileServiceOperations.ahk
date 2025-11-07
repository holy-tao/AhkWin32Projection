#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADsCollection.ahk
#Include .\IADsServiceOperations.ahk

/**
 * The IADsFileServiceOperations interface is a dual interface that inherits from IADsServiceOperations.
 * @remarks
 * 
 * To bind to a file service operations object, use the ADsPath string that identifies the "LanmanServer" service on the host computer, as shown in the following code example.
 * 
 * 
 * ```vb
 * Dim fso As IADsFileServiceOperations
 * On Error Resume Next
 * 
 * ' Replace aDomain with the domain that the computer is located on.
 * ' Replace aComputer with the name of the computer.
 * Set fso = GetObject("WinNT://aDomain/aComputer/LanmanServer")
 * ```
 * 
 * 
 * From this point, you can handle the file service object as just a service object, applying any of the methods of <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsserviceoperations">IADsServiceOperations</a> to the file service object. For example, you can examine the operational status of the file service, start or stop the file service, or change its password.
 * 
 * However, the <b>IADsFileServiceOperations</b> interface allows you to work with open resources and active sessions of the file service. See the following example.
 * 
 * 
 * ```vb
 * For Each r in fso.Resources
 * MsgBox r.User
 * MsgBox r.Path
 * MsgBox r.LockCount
 * Next
 * ```
 * 
 * 
 * For more information about active sessions and open resources, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssession">IADsSession</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsresource">IADsResource</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsfileserviceoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsFileServiceOperations extends IADsServiceOperations{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsFileServiceOperations
     * @type {Guid}
     */
    static IID => Guid("{a02ded10-31ca-11cf-a98a-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Sessions", "Resources"]

    /**
     * 
     * @returns {IADsCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsfileserviceoperations-sessions
     */
    Sessions() {
        result := ComCall(26, this, "ptr*", &ppSessions := 0, "HRESULT")
        return IADsCollection(ppSessions)
    }

    /**
     * 
     * @returns {IADsCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsfileserviceoperations-resources
     */
    Resources() {
        result := ComCall(27, this, "ptr*", &ppResources := 0, "HRESULT")
        return IADsCollection(ppResources)
    }
}
