#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_OPERATOR_TYPE.ahk" { DML_OPERATOR_TYPE }

/**
 * A generic container for an operator description. You construct DirectML operators using the parameters specified in this struct. See IDMLDevice::CreateOperator for additional details.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: [**DML_OPERATOR_TYPE**](/windows/win32/api/directml/ne-directml-dml_operator_type)
     * 
     * The type of the operator description. See <a href="https://msdn.microsoft.com/2D66A3DB-FE61-4EC2-B626-DD008FF14802">DML_OPERATOR_TYPE</a> for the available types.
     */
    Type : DML_OPERATOR_TYPE

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to the operator description. The type of the pointed-to struct must match the value specified in <i>Type.</i>
     */
    Desc : IntPtr

}
