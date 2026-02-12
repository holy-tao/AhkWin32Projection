#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderItemPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderItemPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{2d2c1c97-2704-4729-8fa9-7e6b8e158c2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAsync"]

    /**
     * SetAsyncTraceParamsEx function - Finishes setting up a trace buffer with optional fields for sprintf-style traces.
     * @remarks
     * Exstrace.dll is an optional component that installs with the Simple Mail Transfer Protocol (SMTP) and the Network News Transfer Protocol (NNTP).
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {IStorageItem} item 
     * @param {IIterable<StorageProviderItemProperty>} itemProperties 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/-setasynctraceparamsex
     */
    SetAsync(item, itemProperties) {
        result := ComCall(6, this, "ptr", item, "ptr", itemProperties, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
