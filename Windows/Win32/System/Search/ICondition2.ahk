#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk

/**
 * Extends the functionality of the ICondition interface. ICondition2 provides methods for retrieving information about a search condition.
 * @remarks
 * 
  * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nn-structuredquerycondition-icondition2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICondition2 extends ICondition{
    /**
     * The interface identifier for ICondition2
     * @type {Guid}
     */
    static IID => Guid("{0db8851d-2e5b-47eb-9208-d28c325a01d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLocaleName 
     * @returns {HRESULT} 
     */
    GetLocale(ppszLocaleName) {
        result := ComCall(15, this, "ptr", ppszLocaleName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} ppropkey 
     * @param {Pointer<Int32>} pcop 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetLeafConditionInfo(ppropkey, pcop, ppropvar) {
        result := ComCall(16, this, "ptr", ppropkey, "int*", pcop, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
