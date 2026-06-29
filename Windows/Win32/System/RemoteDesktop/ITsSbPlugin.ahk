#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbPluginNotifySink.ahk" { ITsSbPluginNotifySink }
#Import ".\ITsSbProvider.ahk" { ITsSbProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPluginPropertySet.ahk" { ITsSbPluginPropertySet }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that initialize and terminate plug-ins.
 * @remarks
 * Two different types of plugins are supported - filters and resources. Resource plugins are for supporting new 
 *      types of resources (for example VMs running on different hypervisors). Filter plugins allow the plugins to change 
 *      the information passed to other plugins (for example passing resource requests to the least utilized node.)
 * 
 * To register a resource filter, add these values to the registry.
 * 
 * 
 * <pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>SYSTEM</b>
 *       <b>CurrentControlSet</b>
 *          <b>Services</b>
 *             <b>Tssdis</b>
 *                <b>Parameters</b>
 *                   <b>Plugins</b>
 *                      <b>Resource</b>
 *                         <i>YOUR_RESOURCE_PLUGIN_NAME</i>
 *                            <b>CLSID</b> = {<i>CLSID of your resource provider</i>}<dl>
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
 * <pre><b>HKEY_LOCAL_MACHINE</b>
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
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPlugin extends IUnknown {
    /**
     * The interface identifier for ITsSbPlugin
     * @type {Guid}
     */
    static IID := Guid("{48cd7406-caab-465f-a5d6-baa863b9ea4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        Terminate  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the plug-in.
     * @remarks
     * Plug-ins should call <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbpluginnotifysink-oninitialized">OnInitialized</a> on the specified <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbpluginnotifysink">ITsSbPluginNotifySink</a> sink object.
     * @param {ITsSbProvider} pProvider A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovider">ITsSbProvider</a> provider object.
     * @param {ITsSbPluginNotifySink} pNotifySink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbpluginnotifysink">ITsSbPluginNotifySink</a> notify sink object.
     * @param {ITsSbPluginPropertySet} pPropertySet A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbpluginpropertyset">ITsSbPluginPropertySet</a> plug-in property set object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplugin-initialize
     */
    Initialize(pProvider, pNotifySink, pPropertySet) {
        result := ComCall(3, this, "ptr", pProvider, "ptr", pNotifySink, "ptr", pPropertySet, "HRESULT")
        return result
    }

    /**
     * Performs clean-up and unloads the plug-in.
     * @param {HRESULT} hr Specifies the reason for termination. The plug-in should specify a standard <b>HRESULT</b> error code.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplugin-terminate
     */
    Terminate(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Terminate)
    }
}
