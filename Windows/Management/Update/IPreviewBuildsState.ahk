#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IPreviewBuildsState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewBuildsState
     * @type {Guid}
     */
    static IID => Guid("{a2f2903e-b223-5f63-7546-3e8eac070a2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties"]

    /**
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
