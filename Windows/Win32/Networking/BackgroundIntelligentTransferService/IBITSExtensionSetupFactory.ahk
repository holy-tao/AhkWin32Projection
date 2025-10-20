#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the IBITSExtensionSetupFactory interface to get a pointer to the IBITSExtensionSetup interface.
 * @remarks
 * 
  * This interface is registered on the server when you install the BITS server extension.
  * 
  * On Windows Server 2003, use the <b>Windows Components Wizard</b> to install the BITS server extension. From  <b>Control Panel</b>, select <b>Add or Remove Programs</b>. Then, select <b>Add/Remove Windows Components</b> to display the <b>Windows Components Wizard</b>. The BITS server extension is a sub-component of Internet Information Services (IIS) which is a sub-component of Web Application Server.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bitscfg/nn-bitscfg-ibitsextensionsetupfactory
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBITSExtensionSetupFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBITSExtensionSetupFactory
     * @type {Guid}
     */
    static IID => Guid("{d5d2d542-5503-4e64-8b48-72ef91a32ee1}")

    /**
     * The class identifier for BITSExtensionSetupFactory
     * @type {Guid}
     */
    static CLSID => Guid("{efbbab68-7286-4783-94bf-9461d8b7e7e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject"]

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {BSTR} Path 
     * @param {Pointer<IBITSExtensionSetup>} ppExtensionSetup 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(Path, ppExtensionSetup) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(7, this, "ptr", Path, "ptr*", ppExtensionSetup, "HRESULT")
        return result
    }
}
