#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIND_OPTS.ahk

/**
 * The BIND_OPTS2 structure contains parameters used during a moniker-binding operation.
 * @remarks
 * A <b>BIND_OPTS2</b> structure is stored in a bind context; the same bind context is used by each component of a composite moniker during binding, allowing the same parameters to be passed to all components of a composite moniker. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> for more information about bind contexts.
  * 
  * Moniker clients (use a moniker to acquire an interface pointer to an object) typically do not need to specify values for the members of this structure. The <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function creates a bind context with the bind options set to default values that are suitable for most situations; the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-bindmoniker">BindMoniker</a> function does the same thing when creating a bind context for use in binding a moniker. If you want to modify the values of these bind options, you can do so by passing a <b>BIND_OPTS2</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a> method. Moniker implementers can pass a <b>BIND_OPTS2</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getbindoptions">IBindCtx::GetBindOptions</a> method to retrieve the values of these bind options.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-bind_opts2~r1
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_OPTS2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {BIND_OPTS}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := BIND_OPTS(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * A moniker can use this value during link tracking. If the original persisted data that the moniker is referencing has been moved, the moniker can attempt to reestablish the link by searching for the original data though some adequate mechanism. This member provides additional information on how the link should be resolved. See the documentation of the <i>fFlags</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-resolve">IShellLink::Resolve</a>.
     * 
     * COM's file moniker implementation uses the shell link mechanism to reestablish links and passes these flags to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-resolve">IShellLink::Resolve</a>.
     * @type {Integer}
     */
    dwTrackFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The class context, taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration, that is to be used for instantiating the object. Monikers typically pass this value to the <i>dwClsContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>.
     * @type {Integer}
     */
    dwClassContext {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">LCID value</a> indicating the client's preference for the locale to be used by the object to which they are binding. A moniker passes this value to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclassactivator-getclassobject">IClassActivator::GetClassObject</a>.
     * @type {Integer}
     */
    locale {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure. This member allows clients calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> to specify server information. Clients may pass a <b>BIND_OPTS2</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a> method. If a server name is specified in the <b>COSERVERINFO</b> structure, the moniker bind will be forwarded to the specified computer. <b>SetBindOptions</b> only copies the struct members of <b>BIND_OPTS2</b>, not the <b>COSERVERINFO</b> structure and the pointers it contains. Callers may not free any of these pointers until the bind context is released. COM's new class moniker does not currently honor the <b>pServerInfo</b> flag.
     * @type {Pointer<COSERVERINFO>}
     */
    pServerInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
