#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusSession.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a focus session.
  * 
  * > [!IMPORTANT]
  * > The **Windows.UI.Shell.FocusSession** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * Get an instance of this class by calling one of the overloads of [TryStartFocusSession](focussessionmanager_trystartfocussession_982259691.md) or [GetSession](focussessionmanager_getsession_996400911.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussession
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class FocusSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a platform-assigned unique identifier for a focus session.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussession.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IFocusSession")) {
            if ((queryResult := this.QueryInterface(IFocusSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSession := IFocusSession(outPtr)
        }

        return this.__IFocusSession.get_Id()
    }

    /**
     * Ends the focus session.
     * 
     * > [!IMPORTANT]
     * > The **FocusSession.End** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.focussession.end
     */
    End() {
        if (!this.HasProp("__IFocusSession")) {
            if ((queryResult := this.QueryInterface(IFocusSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSession := IFocusSession(outPtr)
        }

        return this.__IFocusSession.End()
    }

;@endregion Instance Methods
}
