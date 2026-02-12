#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowSpoolStreamContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowSpoolStreamContent
     * @type {Guid}
     */
    static IID => Guid("{72e55ece-e406-4b74-84e1-3ff3fdcdaf70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputStream"]

    /**
     * 
     * @returns {IInputStream} 
     */
    GetInputStream() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(result_)
    }
}
