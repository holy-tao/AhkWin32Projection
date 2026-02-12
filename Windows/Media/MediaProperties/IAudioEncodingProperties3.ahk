#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IAudioEncodingProperties3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEncodingProperties3
     * @type {Guid}
     */
    static IID => Guid("{87600341-748c-4f8d-b0fd-10caf08ff087}")

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
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(result_)
    }
}
