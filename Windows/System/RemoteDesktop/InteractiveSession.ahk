#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractiveSessionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides Remote Desktop information about the current session.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.interactivesession
 * @namespace Windows.System.RemoteDesktop
 * @version WindowsRuntime 1.4
 */
class InteractiveSession extends IInspectable {
;@region Static Properties
    /**
     * Indicates whether the calling process is running in a Remote Desktop session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.interactivesession.isremote
     * @type {Boolean} 
     */
    static IsRemote {
        get => InteractiveSession.get_IsRemote()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsRemote() {
        if (!InteractiveSession.HasProp("__IInteractiveSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.InteractiveSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInteractiveSessionStatics.IID)
            InteractiveSession.__IInteractiveSessionStatics := IInteractiveSessionStatics(factoryPtr)
        }

        return InteractiveSession.__IInteractiveSessionStatics.get_IsRemote()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
