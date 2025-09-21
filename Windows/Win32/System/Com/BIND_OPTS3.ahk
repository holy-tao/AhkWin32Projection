#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIND_OPTS.ahk
#Include .\BIND_OPTS2.ahk

/**
 * The BIND_OPTS3 structure contains parameters used during a moniker-binding operation.
 * @remarks
 * A <b>BIND_OPTS3</b> structure is stored in a bind context; the same bind context is used by each component of a composite moniker during binding, allowing the same parameters to be passed to all components of a composite moniker. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> for more information about bind contexts.
  * 
  * Moniker clients (use a moniker to acquire an interface pointer to an object) typically do not need to specify values for the members of this structure. The <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function creates a bind context with the bind options set to default values that are suitable for most situations; the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-bindmoniker">BindMoniker</a> function does the same thing when creating a bind context for use in binding a moniker. If you want to modify the values of these bind options, you can do so by passing a <b>BIND_OPTS3</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a> method. Moniker implementers can pass a <b>BIND_OPTS3</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getbindoptions">IBindCtx::GetBindOptions</a> method to retrieve the values of these bind options.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-bind_opts3~r1
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_OPTS3 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BIND_OPTS2}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := BIND_OPTS2(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * A handle to the window that becomes the owner of the elevation UI, if applicable. If <b>hwnd</b> is <b>NULL</b>, COM will call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getactivewindow">GetActiveWindow</a> function to find a window handle associated with the current thread. This case might occur if the client is a script, which cannot fill in a <b>BIND_OPTS3</b> structure. In this case, COM will try to use the window associated with the script thread.
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
