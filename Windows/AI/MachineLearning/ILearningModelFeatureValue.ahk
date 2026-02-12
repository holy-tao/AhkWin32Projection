#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * The instantiated value for a feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.ilearningmodelfeaturevalue
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelFeatureValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelFeatureValue
     * @type {Guid}
     */
    static IID => Guid("{f51005db-4085-4dfe-9fed-95eb0c0cf75c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind"]

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The data type of the feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.ilearningmodelfeaturevalue.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
