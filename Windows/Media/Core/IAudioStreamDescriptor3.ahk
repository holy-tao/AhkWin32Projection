#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioStreamDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IAudioStreamDescriptor3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamDescriptor3
     * @type {Guid}
     */
    static IID => Guid("{4d220da1-8e83-44ef-8973-2f63e993f36b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Copy"]

    /**
     * Describes the four steps to take to copy and paste a formula from one cell into another using CTRL+C and CTRL+V.
     * @returns {AudioStreamDescriptor} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStreamDescriptor(result_)
    }
}
