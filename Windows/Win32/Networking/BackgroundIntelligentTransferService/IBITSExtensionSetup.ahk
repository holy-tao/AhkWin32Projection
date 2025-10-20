#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the IBITSExtensionSetup interface to enable or disable BITS uploads to a virtual directory.
 * @remarks
 * 
  * This interface is registered on the server when you install the BITS server extension.
  * 
  * On Windows Server 2003, use the <b>Windows Components Wizard</b> to install the BITS server extension. From  <b>Control Panel</b>, select <b>Add or Remove Programs</b>. Then, select <b>Add/Remove Windows Components</b> to display the <b>Windows Components Wizard</b>. The BITS server extension is a sub-component of Internet Information Services (IIS) which is a sub-component of Web Application Server.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nn-bitscfg-ibitsextensionsetup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBITSExtensionSetup extends IDispatch{
    /**
     * The interface identifier for IBITSExtensionSetup
     * @type {Guid}
     */
    static IID => Guid("{29cfbbf7-09e4-4b97-b0bc-f2287e3d8eb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableBITSUploads() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableBITSUploads() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskName 
     * @returns {HRESULT} 
     */
    GetCleanupTaskName(pTaskName) {
        result := ComCall(9, this, "ptr", pTaskName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    GetCleanupTask(riid, ppUnk) {
        result := ComCall(10, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
