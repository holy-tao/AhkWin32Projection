#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentShareFolderRequestOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Options for how to perform the share folder operation.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderrequestoptions
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentShareFolderRequestOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentShareFolderRequestOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentShareFolderRequestOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Determines whether applications running inside the Isolated Windows Environment can write data to this folder being shared.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderrequestoptions.allowwrite
     * @type {Boolean} 
     */
    AllowWrite {
        get => this.get_AllowWrite()
        set => this.put_AllowWrite(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * **Deprecated.** Results of [IsolatedWindowsEnvironmentShareFolderRequestOptions](isolatedwindowsenvironmentsharefolderrequestoptions.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentShareFolderRequestOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWrite() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentShareFolderRequestOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentShareFolderRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentShareFolderRequestOptions := IIsolatedWindowsEnvironmentShareFolderRequestOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentShareFolderRequestOptions.get_AllowWrite()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWrite(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentShareFolderRequestOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentShareFolderRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentShareFolderRequestOptions := IIsolatedWindowsEnvironmentShareFolderRequestOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentShareFolderRequestOptions.put_AllowWrite(value)
    }

;@endregion Instance Methods
}
