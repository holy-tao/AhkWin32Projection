#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IDepthMediaFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDepthMediaFrame2
     * @type {Guid}
     */
    static IID => Guid("{6cca473d-c4a4-4176-b0cd-33eae3b35aa3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxReliableDepth", "get_MinReliableDepth"]

    /**
     * @type {Integer} 
     */
    MaxReliableDepth {
        get => this.get_MaxReliableDepth()
    }

    /**
     * @type {Integer} 
     */
    MinReliableDepth {
        get => this.get_MinReliableDepth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxReliableDepth() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinReliableDepth() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
