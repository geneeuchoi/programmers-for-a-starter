import java.util.ArrayList;
import java.util.Arrays;

class Solution {
    public int[] solution(int[] arr, int divisor) {
        ArrayList<Integer> arrayList = new ArrayList<>();
        
        for(int i : arr) {
            if(i % divisor == 0) {
                arrayList.add(i);
            }
        }
        
        if(arrayList.isEmpty()) {
            return new int[] {-1};
        } else {
            int[] answer = new int[arrayList.size()];
            for (int i = 0; i < arrayList.size(); i++) {
                answer[i] = arrayList.get(i);
        }
        Arrays.sort(answer);
        return answer;
        }
    }
}