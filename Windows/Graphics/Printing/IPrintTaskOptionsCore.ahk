#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PrintPageDescription.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the core functionality for a **PrintTaskOptions** object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscore
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionsCore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionsCore
     * @type {Guid}
     */
    static IID => Guid("{1bdbb474-4ed1-41eb-be3c-72d18ed67337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPageDescription"]

    /**
     * Gets the page description for a print job.
     * @param {Integer} jobPageNumber The job page number.
     * @returns {PrintPageDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscore.getpagedescription
     */
    GetPageDescription(jobPageNumber) {
        description := PrintPageDescription()
        result := ComCall(6, this, "uint", jobPageNumber, "ptr", description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return description
    }
}
