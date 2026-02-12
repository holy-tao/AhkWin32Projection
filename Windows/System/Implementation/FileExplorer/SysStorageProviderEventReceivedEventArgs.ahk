#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISysStorageProviderEventReceivedEventArgs.ahk
#Include .\ISysStorageProviderEventReceivedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * For internal use only.
  * 
  * > [IMPORTANT]
  * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.sysstorageprovidereventreceivedeventargs
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class SysStorageProviderEventReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISysStorageProviderEventReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISysStorageProviderEventReceivedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @param {HSTRING} json For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @returns {SysStorageProviderEventReceivedEventArgs} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.sysstorageprovidereventreceivedeventargs.#ctor
     */
    static CreateInstance(json) {
        if (!SysStorageProviderEventReceivedEventArgs.HasProp("__ISysStorageProviderEventReceivedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Implementation.FileExplorer.SysStorageProviderEventReceivedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISysStorageProviderEventReceivedEventArgsFactory.IID)
            SysStorageProviderEventReceivedEventArgs.__ISysStorageProviderEventReceivedEventArgsFactory := ISysStorageProviderEventReceivedEventArgsFactory(factoryPtr)
        }

        return SysStorageProviderEventReceivedEventArgs.__ISysStorageProviderEventReceivedEventArgsFactory.CreateInstance(json)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.sysstorageprovidereventreceivedeventargs.json
     * @type {HSTRING} 
     */
    Json {
        get => this.get_Json()
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
    get_Json() {
        if (!this.HasProp("__ISysStorageProviderEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISysStorageProviderEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISysStorageProviderEventReceivedEventArgs := ISysStorageProviderEventReceivedEventArgs(outPtr)
        }

        return this.__ISysStorageProviderEventReceivedEventArgs.get_Json()
    }

;@endregion Instance Methods
}
