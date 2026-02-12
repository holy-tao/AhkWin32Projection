#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHandwritingViewCandidatesChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandwritingViewCandidatesChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6f5f63d8-56b1-56c5-a416-c19c16bf7884}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CandidatesSessionId"]

    /**
     * @type {Integer} 
     */
    CandidatesSessionId {
        get => this.get_CandidatesSessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CandidatesSessionId() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
