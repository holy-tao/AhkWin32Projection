#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureAccessStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureAccessStatics
     * @type {Guid}
     */
    static IID => Guid("{743ed370-06ec-5040-a58a-901f0f757095}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessAsync"]

    /**
     * 
     * @param {Integer} request 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync(request) {
        result := ComCall(6, this, "int", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
