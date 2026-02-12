#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IApplicationOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationOverrides
     * @type {Guid}
     */
    static IID => Guid("{25f99ff7-9347-459a-9fac-b2d0e11c1a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivated", "OnLaunched", "OnFileActivated", "OnSearchActivated", "OnShareTargetActivated", "OnFileOpenPickerActivated", "OnFileSavePickerActivated", "OnCachedFileUpdaterActivated", "OnWindowCreated"]

    /**
     * 
     * @param {IActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnActivated(args) {
        result := ComCall(6, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {LaunchActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnLaunched(args) {
        result := ComCall(7, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FileActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnFileActivated(args) {
        result := ComCall(8, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SearchActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnSearchActivated(args) {
        result := ComCall(9, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ShareTargetActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnShareTargetActivated(args) {
        result := ComCall(10, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FileOpenPickerActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnFileOpenPickerActivated(args) {
        result := ComCall(11, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {FileSavePickerActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnFileSavePickerActivated(args) {
        result := ComCall(12, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CachedFileUpdaterActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnCachedFileUpdaterActivated(args) {
        result := ComCall(13, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WindowCreatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnWindowCreated(args) {
        result := ComCall(14, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
