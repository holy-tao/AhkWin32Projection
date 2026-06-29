#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to contain parameter header information for a Diffie-Hellman key.
 * @remarks
 * This structure is used as a header for a larger buffer. The single memory block consists of this structure followed by a buffer of <b>cbKeyLength</b> size that contains the Diffie-Hellman prime number, and another buffer of <b>cbKeyLength</b> size that contains the Diffie-Hellman generator number. Both of these numbers are in big-endian format.
 * 
 * The following example shows how to calculate the sizes needed for this buffer and how to fill in the members of this structure.
 * 
 * 
 * ```cpp
 * // In this example, the rgbModulus variable is a byte array that contains the modulus in big-endian byte order. 
 * // The rgbGenerator variable is a byte array that contains the generator in big-endian byte order.
 * 
 * ULONG cbDHParams = sizeof(BCRYPT_DH_PARAMETER_HEADER) +     (cbKeySize * 2);
 * PBYTE pbDHParams = (PBYTE)malloc(cbDHParams);
 * if(!pbDHParams)
 * {
 *     status = STATUS_NO_MEMORY;
 *     goto Cleanup;
 * }
 * 
 * BCRYPT_DH_PARAMETER_HEADER *pDHParamHeader;
 * pDHParamHeader = (BCRYPT_DH_PARAMETER_HEADER*)pbDHParams;
 * pDHParamHeader->cbLength = cbDHParams;
 * pDHParamHeader->cbKeyLength = cbKeySize;
 * pDHParamHeader->dwMagic = BCRYPT_DH_PARAMETERS_MAGIC;
 * 
 * // Add the modulus to the parameters.
 * // The rgbModulus argument is a byte array that contains the modulus.
 * PBYTE pbTemp = (PBYTE)pbDHParams + sizeof(BCRYPT_DH_PARAMETER_HEADER);
 * CopyMemory(pbTemp, rgbModulus, pDHParamHeader->cbKeyLength);
 * 
 * // Add the generator to the parameters.
 * // The rgbGenerator argument is a byte array that contains the generator.
 * pbTemp += pDHParamHeader->cbKeyLength;
 * CopyMemory(pbTemp, rgbGenerator, pDHParamHeader->cbKeyLength);
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_dh_parameter_header
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DH_PARAMETER_HEADER {
    #StructPack 4

    /**
     * The total size, in bytes, of this structure and the buffer that immediately follows this structure in memory.
     */
    cbLength : UInt32

    /**
     * The magic value for the key.
     * 
     * 
     * This member must be the following value.
     */
    dwMagic : UInt32

    /**
     * The size, in bytes, of the key that this structure applies to.
     */
    cbKeyLength : UInt32

}
