#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IStagePackageOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStagePackageOptions2
     * @type {Guid}
     */
    static IID => Guid("{990c4ccc-6226-4192-ba92-79875fce0d9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpectedDigests"]

    /**
     * @type {IMap<Uri, HSTRING>} 
     */
    ExpectedDigests {
        get => this.get_ExpectedDigests()
    }

    /**
     * 
     * @returns {IMap<Uri, HSTRING>} 
     */
    get_ExpectedDigests() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap(Uri, (ptr) => HSTRING({ Value: ptr }), value)
    }
}
