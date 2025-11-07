#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that initialize and terminate plug-ins.
 * @remarks
 * 
 * Two different types of plugins are supported - filters and resources. Resource plugins are for supporting new 
 *      types of resources (for example VMs running on different hypervisors). Filter plugins allow the plugins to change 
 *      the information passed to other plugins (for example passing resource requests to the least utilized node.)
 * 
 * To register a resource filter, add these values to the registry.
 * 
 * 
 * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
 *    <b>SYSTEM</b>
 *       <b>CurrentControlSet</b>
 *          <b>Services</b>
 *             <b>Tssdis</b>
 *                <b>Parameters</b>
 *                   <b>Plugins</b>
 *                      <b>Resource</b>
 *                         <i>YOUR_RESOURCE_PLUGIN_NAME</i>
 *                            <b>CLSID</b> = {<i>CLSID of your resouce provider</i>}<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>Provider</b> = <i>Name_of_resource_provider</i><dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>IsEnabled</b> = 1<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_DWORD</dd>
 * </dl>
 * </pre>
 * 
 * 
 * The names used should be unique and identify the company, product, and/or feature. They are not shown to the user 
 *      but can be seen in some logs.
 * 
 *  
 * 
 * To register a filter provider, add these values to the registry.
 * 
 * 
 * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
 *    <b>SYSTEM</b>
 *       <b>CurrentControlSet</b>
 *          <b>Services</b>
 *             <b>Tssdis</b>
 *                <b>Parameters</b>
 *                   <b>Plugins</b>
 *                      <b>Filter</b>
 *                         <i>1</i>
 *                            <b>CLSID</b> = {<i>CLSID of filter provider 1</i>}<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>Provider</b> = <i>Name of filter provider 1</i><dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>IsEnabled</b> = 1<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_DWORD</dd>
 * </dl>
 *                         <i>2…</i>
 *                            <b>CLSID</b> = {<i>CLSID of filter provider 2</i>}<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>Provider</b> = <i>Name of filter provider 2</i><dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_SZ</dd>
 * </dl>
 *                            <b>IsEnabled</b> = 1<dl>
 * <dt>                           Data type</dt>
 * <dd>                           REG_DWORD</dd>
 * </dl>
 * </pre>
 * 
 * 
 * First the system will load Filter 1, then load Filter 2, etc..
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbPlugin
     * @type {Guid}
     */
    static IID => Guid("{48cd7406-caab-465f-a5d6-baa863b9ea4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Terminate"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ITsSbProvider} pProvider 
     * @param {ITsSbPluginNotifySink} pNotifySink 
     * @param {ITsSbPluginPropertySet} pPropertySet 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pProvider, pNotifySink, pPropertySet) {
        result := ComCall(3, this, "ptr", pProvider, "ptr", pNotifySink, "ptr", pPropertySet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplugin-terminate
     */
    Terminate(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }
}
