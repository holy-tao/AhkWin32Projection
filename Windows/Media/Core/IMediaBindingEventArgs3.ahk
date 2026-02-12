#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaBindingEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBindingEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{f8eb475e-19be-44fc-a5ed-7aba315037f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDownloadOperation"]

    /**
     * 
     * @param {DownloadOperation} downloadOperation_ 
     * @returns {HRESULT} 
     */
    SetDownloadOperation(downloadOperation_) {
        result := ComCall(6, this, "ptr", downloadOperation_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
