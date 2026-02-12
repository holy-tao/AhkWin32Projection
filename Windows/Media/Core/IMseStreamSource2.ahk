#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMseStreamSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMseStreamSource2
     * @type {Guid}
     */
    static IID => Guid("{66f57d37-f9e7-418a-9cde-a020e956552b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LiveSeekableRange", "put_LiveSeekableRange"]

    /**
     * @type {IReference<MseTimeRange>} 
     */
    LiveSeekableRange {
        get => this.get_LiveSeekableRange()
        set => this.put_LiveSeekableRange(value)
    }

    /**
     * 
     * @returns {IReference<MseTimeRange>} 
     */
    get_LiveSeekableRange() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetMseTimeRange(), value)
    }

    /**
     * 
     * @param {IReference<MseTimeRange>} value 
     * @returns {HRESULT} 
     */
    put_LiveSeekableRange(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
