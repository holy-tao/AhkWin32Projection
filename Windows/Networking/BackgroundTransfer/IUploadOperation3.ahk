#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IUploadOperation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUploadOperation3
     * @type {Guid}
     */
    static IID => Guid("{42c92ca3-de39-4546-bc62-3774b4294de3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeCurrentInTransferGroup"]

    /**
     * 
     * @returns {HRESULT} 
     */
    MakeCurrentInTransferGroup() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
