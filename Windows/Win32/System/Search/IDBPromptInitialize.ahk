#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBPromptInitialize extends IUnknown{
    /**
     * The interface identifier for IDBPromptInitialize
     * @type {Guid}
     */
    static IID => Guid("{2206ccb0-19c1-11d1-89e0-00c04fd7a829}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {HWND} hWndParent 
     * @param {Integer} dwPromptOptions 
     * @param {Integer} cSourceTypeFilter 
     * @param {Pointer<UInt32>} rgSourceTypeFilter 
     * @param {PWSTR} pwszszzProviderFilter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    PromptDataSource(pUnkOuter, hWndParent, dwPromptOptions, cSourceTypeFilter, rgSourceTypeFilter, pwszszzProviderFilter, riid, ppDataSource) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pwszszzProviderFilter := pwszszzProviderFilter is String ? StrPtr(pwszszzProviderFilter) : pwszszzProviderFilter

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", hWndParent, "uint", dwPromptOptions, "uint", cSourceTypeFilter, "uint*", rgSourceTypeFilter, "ptr", pwszszzProviderFilter, "ptr", riid, "ptr", ppDataSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Integer} dwPromptOptions 
     * @param {PWSTR} pwszInitialDirectory 
     * @param {PWSTR} pwszInitialFile 
     * @param {Pointer<PWSTR>} ppwszSelectedFile 
     * @returns {HRESULT} 
     */
    PromptFileName(hWndParent, dwPromptOptions, pwszInitialDirectory, pwszInitialFile, ppwszSelectedFile) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pwszInitialDirectory := pwszInitialDirectory is String ? StrPtr(pwszInitialDirectory) : pwszInitialDirectory
        pwszInitialFile := pwszInitialFile is String ? StrPtr(pwszInitialFile) : pwszInitialFile

        result := ComCall(4, this, "ptr", hWndParent, "uint", dwPromptOptions, "ptr", pwszInitialDirectory, "ptr", pwszInitialFile, "ptr", ppwszSelectedFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
