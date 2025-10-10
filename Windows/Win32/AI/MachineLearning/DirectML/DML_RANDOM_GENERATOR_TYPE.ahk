#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify types of random random-number generator.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_random_generator_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_RANDOM_GENERATOR_TYPE{

    /**
     * Specifies a generator for pseudo-random numbers according to the [Philox 4x32-10 algorithm](http://www.thesalmons.org/john/random123/papers/random123sc11.pdf).
     * @type {Integer (Int32)}
     */
    static DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10 => 0
}
